module Avocado
  module Resources
    class Resource
      class << self
        @@fields = {}

        def fields(&block)
          @@fields[self] ||= []
          yield
        end

        def get_fields
          @@fields[self] or []
        end

        def id(name = 'ID', **args)
          @@fields[self].push Avocado::Fields::IdField::new(name, **args)
        end

        def text(name, **args, &block)
          @@fields[self].push Avocado::Fields::TextField::new(name, **args, &block)
        end

        def password(name, **args, &block)
          @@fields[self].push Avocado::Fields::PasswordField::new(name, **args, &block)
        end

        def textarea(name, **args, &block)
          @@fields[self].push Avocado::Fields::TextareaField::new(name, **args, &block)
        end

        def number(name, **args, &block)
          @@fields[self].push Avocado::Fields::NumberField::new(name, **args, &block)
        end

        def boolean(name, **args, &block)
          @@fields[self].push Avocado::Fields::BooleanField::new(name, **args, &block)
        end

        def select(name, **args, &block)
          @@fields[self].push Avocado::Fields::SelectField::new(name, **args, &block)
        end

        def date(name, **args)
          @@fields[self].push Avocado::Fields::DateField::new(name, **args)
        end

        def datetime(name, **args)
          @@fields[self].push Avocado::Fields::DatetimeField::new(name, **args)
        end

        def boolean_group(name, **args, &block)
          @@fields[self].push Avocado::Fields::BooleanGroupField::new(name, **args, &block)
        end

        def belongs_to(name, **args)
          @@fields[self].push Avocado::Fields::BelongsToField::new(name, **args)
        end

        def has_one(name, **args)
          @@fields[self].push Avocado::Fields::HasOneField::new(name, **args)
        end

        def has_many(name, **args)
          @@fields[self].push Avocado::Fields::HasManyField::new(name, **args)
        end

        def file(name, **args)
          @@fields[self].push Avocado::Fields::FileField::new(name, **args)
        end

        def files(name, **args)
          @@fields[self].push Avocado::Fields::FilesField::new(name, **args)
        end
      end
    end
  end
end