# Call For Maintainers

TeamSnap is no longer using Chef and this cookbook is no longer actively
maintaned. We would like to find a new maintainer for this cookbook. Please
contact Mark Cornick (<mark@teamsnap.com>) if you'd like to take over.
Thanks!

# the_silver_searcher cookbook

Builds [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
from source.

# Requirements

This cookbook supports Debian and Red Hat platform families. It is
tested on the most recent versions of CentOS 5 and 6, the most recent
stable version of Debian, the most recent version of Fedora, the current
and previous LTS versions of Ubuntu, and the most recent version of
Ubuntu. If you plan to run Test Kitchen against this cookbook, you will
need Vagrant 1.5 or greater.

The `build_essential` cookbook is the only other cookbook required.

# Usage

Include `recipe[the_silver_searcher]` in a run list.

# Attributes

* `[:the_silver_searcher][:version]` = version number to install
* `[:the_silver_searcher][:checksum]` = checksum of tar.gz source for this version
* `[:the_silver_searcher][:url]` = url of tar.gz source
* `[:the_silver_searcher][:build_opt]` = option for build.sh
                                         If you want to install other directory,
                                         set this parameter as follows.
                                         '--prefix=/opt/the_silver_searcher'

# Recipes

* default - installs The Silver Searcher to `/usr/local/bin/ag`

# Author

Author:: Mark Cornick (<mark@teamsnap.com>)

# Contributors

Thanks to:

* Yusuke Murata (muratayusuke)
