# cog_deploy_key custom resource
Chef custom resource to distribute deployment keys.

## Roadmap
- encapsulate optional use of chef-vault

## Supported Platforms
- linux

## Usage

    deploy_key 'name_of_key' do
      key_location '/path/to/directory'       # will be merged with 'name_of_key'
      key_content  'key content'
      user          'user name'
      action :create, :delete
    end

Add dependency to your cookbook's `metadata.rb`

    depends 'cog_deploy_key'

## License and Authors

Author:: Andreas Wagner (andreas.wagner@cashongo.co.uk)
