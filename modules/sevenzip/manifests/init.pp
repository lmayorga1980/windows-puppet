
class sevenzip ($version = '9.22') {

  $pkg = "7zip-${version}"

  package { $pkg:
    ensure   => installed,
    name     => "7-Zip ${version} (x64 edition)",
    source   => "${shared_drive}\\7zip\\${pkg}.msi",
  }
}
