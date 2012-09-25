maintainer       "Stanislav Bogatyrev"
maintainer_email "realloc@realloc.spb.ru"
license          "All rights reserved"
description      "Installs/Configures package repositories"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
%w{ ubuntu debian }.each do |os|
  supports os
end
depends apt
