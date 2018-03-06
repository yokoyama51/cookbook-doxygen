
include_recipe "build-essential"

package 'cmake'


remote_file "#{Chef::Config['file_cache_path']}/doxygen-#{node['doxygen']['version']}.tar.gz" do
  source    node['doxygen']['url']
  checksum  node['doxygen']['checksum']
  mode      '0644'
  not_if "test -f #{Chef::Config['file_cache_path']}/doxygen-#{node['doxygen']['version']}.tar.gz"
end


execute "install_doxygen #{node['doxygen']['version']} from source" do
  live_stream true if Chef::Resource::Execute.method_defined?(:live_stream)
  user  "root"
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    mkdir -p doxygen-#{node['doxygen']['version']} && tar zxf doxygen-#{node['doxygen']['version']}.tar.gz -C doxygen-#{node['doxygen']['version']} --strip-components 1

    cd doxygen-#{node['doxygen']['version']} && mkdir build && cd build
    cmake -G "Unix Makefiles" .. && make && make install
  COMMAND
  not_if "doxygen --version | grep #{node['doxygen']['version']}"
end
