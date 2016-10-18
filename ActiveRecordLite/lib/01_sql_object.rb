require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_   accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    @columns ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      LIMIT
        0
    SQL

    @columns[0].map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column) do
        attributes[column]
      end

      define_method("#{column}=") do |value|
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end

  def self.all
    all = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(all)
  end

  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end

  end

  def self.find(id)
    hash_object = DBConnection.execute(<<-SQL)
    SELECT
      #{table_name}.*
    FROM
      #{table_name}
    WHERE
      #{table_name}.id = #{id}
    SQL

    parse_all(hash_object).first
  end

  def initialize(params = {})
    columns_arr = self.class.columns
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym

      unless columns_arr.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      end

      send("#{attr_name}=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |attr_name|
      send(attr_name)
    end
  end

  def insert
    columns = self.class.columns
    col_names = columns.join(", ")
    question_marks = ["?"] * columns.length
    question_marks = question_marks.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id ||= DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns
    columns = columns.map do |attr_name|
      "#{attr_name} = ?"
    end.join(", ")
    attribute_values.drop(1)
    DBConnection.execute(<<-SQL, *attribute_values)
      UPDATE
        #{self.class.table_name}
      SET
        #{columns}
      WHERE
        #{self.class.table_name}.id = #{self.id}
    SQL
  end

  def save
    if self.id
      update
    else
      insert
    end
  end
end
