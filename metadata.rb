name 'the_silver_searcher'
maintainer 'Mark Cornick'
maintainer_email 'mark@cornick.io'
license 'MIT'
description 'Installs/Configures The Silver Searcher'
depends 'build-essential'
depends 'chef-sugar'
version '1.4.1'

%w(debian ubuntu redhat centos fedora).each do |platform|
  supports platform
end
