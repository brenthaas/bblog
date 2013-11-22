set :stage, :production

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
role :app, %w{devops@blog.lowkeysoftware.com}
role :web, %w{devops@blog.lowkeysoftware.com}
role :db,  %w{devops@blog.lowkeysoftware.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server 'blog.lowkeysoftware.com',
        user: 'devops',
        roles: %w{web app db},
        ssh_options: {
          user: 'devops',
          keys: %w(/Users/loquie/.ssh/loquiekey.pem),
          auth_methods: %w(publickey)
        }

desc "Report Uptimes"
task :uptime do
  on roles(:all) do |host|
    info "Host #{host} (#{host.roles.join(', ')}):\t#{capture(:uptime)}"
  end
end

# fetch(:default_env).merge!(rails_env: :production)
