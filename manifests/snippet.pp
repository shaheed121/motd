# Define motd::snippet
# ===========================
#
# This defined type adds custom contents into motd file.
#
# Parameters
# ----------
#
# * `content`
# Content to be added. Can be either a string or a template. Will error out on empty string.
#
# * `order`
# Optional parameter order in which the content need to be added in motd file. Default is 50.
#
# Variables
# ----------
#
# This defined type requires no external variables.
#
# Examples
# --------
#
# motd::snippet { 'Title':
#    content => "Content comes here. You can use template too instead of the string.",
# }
#
# Authors
# -------
#
# Abdul Shaheed <shaheed121@gmail.com>
#

define motd::snippet (
  String[1]                 $content,
  Optional[Integer[11, 89]] $order   = 50,
) {

  concat::fragment { "/etc/motd/${order}/${name}":
    target  => '/etc/motd',
    order   => $order,
    content => $content,
  }
}
