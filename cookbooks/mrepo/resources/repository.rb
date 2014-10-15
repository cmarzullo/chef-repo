actions :create, :delete
default_action :create

attribute :repoid, :kind_of => String, :name_attribute => true
attribute :release, :kind_of => String
attribute :desc, :kind_of => String
attribute :arch, :kind_of => String
attribute :iso, :kind_of => String
attribute :metadata, :kind_of => String
attribute :sources, :kind_of => Hash

attr_accessor :exists
