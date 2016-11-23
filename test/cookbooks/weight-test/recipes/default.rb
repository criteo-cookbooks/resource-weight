# Show that weight can be used on any resource
execute 'rm -rf /' do
  weight 42
  action :nothing
end

# Another example of resource
reboot 'why not?' do
  weight 5
  action :cancel # chefspec can't assert params value on resource with :nothing action
end

# Converged resource behavior is not changed
execute 'rm -f something && touch something' do
  weight 0.1
end

# Not specifying any weight does not modify behavior
execute 'uname'

include_recipe 'resource-weight::default'

# Test default value set by attributes
reboot 'another reboot' do
  action :cancel # chefspec can't assert params value on resource with :nothing action
end
