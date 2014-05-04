module Foo
  class ModelGenerator < Rails::Generators::Base
    desc "Generates the intializer"

    source_root File.expand_path(Rails.root)

    argument :model_name, :type => :string

    def generate_model
      copy_file model_filename, File.join(engine_root, model_filename)

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          private

          def set_defaults
            if self.new_record?
              # self.markup_language ||= #{module_name}::Configuration.default_markup_language
            end # if
          end # def

        eos
      end

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          def to_s
            #{to_s_column}
          end # def

        eos
      end

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # validations

        eos
      end

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # nested set support
          acts_as_nested_set

        eos
      end if add_acts_as_nested_set?

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # markup support
          acts_as_markup :language => :variable,
                         :columns  => [ :description ]

        eos
      end if add_acts_as_markup?

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # friendly id support
          extend FriendlyId
          friendly_id :name, :use => :slugged

        eos
      end if add_friendly_id?

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # callbacks
          after_initialize :set_defaults

        eos
      end

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # attributes

        eos
      end

      inject_into_class File.join(engine_root, model_filename), model_name do
        <<-eos.gsub(/^([ ]){8}/, "")
          # associations

        eos
      end

      run("mv #{File.join(Rails.root, model_filename)} #{File.join(Rails.root, model_filename)}.original")
    end # def

    private

    def add_acts_as_nested_set?
      columns.include?('rgt')  && columns.include?('lft')
    end

    def add_acts_as_markup?
      columns.include?('description') && columns.include?('markup_language')
    end

    def add_friendly_id?
      columns.include?('slug') && columns.include?('name')
    end

    def columns
      model_name.constantize.column_names
    end

    def model_filename
      "app/models/#{model_name.underscore}.rb"
    end

    def module_name
      model_name.deconstantize
    end

    def active_admin_root
      File.join(engine_root, "lib", module_name.underscore, "active_admin", "resources")
    end

    def engine_root
      File.join(Rails.root, "..", "..")
    end

    def table_name
      model_name.underscore.pluralize.gsub('/', '_')
    end

    def to_s_column
      %w(name title label).each do |c|
        return c if columns.include? c
      end
      columns.first
    end
  end
end
