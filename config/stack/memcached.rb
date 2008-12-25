package :memcached_daemon, :provides => :memcached do
  description 'Memcached, a distributed memory object store'
  apt %w( memcached )
  
  post :install, "/etc/init.d/memcached start"
  
  verify do
    has_process "memcached"
  end
end

package :libmemcached do
  source 'http://download.tangent.org/libmemcached-0.25.tar.gz'
  requires :memcached
end