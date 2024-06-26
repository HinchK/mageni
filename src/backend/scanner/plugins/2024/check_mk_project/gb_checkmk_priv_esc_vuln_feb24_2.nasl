# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:check_mk_project:check_mk";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.126709");
  script_version("2024-03-06T05:05:53+0000");
  script_tag(name:"last_modification", value:"2024-03-06 05:05:53 +0000 (Wed, 06 Mar 2024)");
  script_tag(name:"creation_date", value:"2024-03-04 11:20:26 +0000 (Mon, 04 Mar 2024)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:S/C:C/I:C/A:C");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Checkmk < 2.2.0p24, 2.3.x < 2.3.0b1, 2.4.x < 2.4.0b1 Privilege Escalation Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Privilege escalation");
  script_dependencies("gb_check_mk_web_detect.nasl");
  script_mandatory_keys("check_mk/detected");

  script_tag(name:"summary", value:"Checkmk is prone to a privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Checkmk allows to privilege escalation if the Kaspersky
  Anti-Virus plugin (which is run by root user) is running executables which can be changed by less
  privileged users.");

  script_tag(name:"affected", value:"Checkmk versions prior to 2.2.0p24, 2.3.x prior to 2.3.0b1 and
  2.4.x prior to 2.4.0b1.");

  script_tag(name:"solution", value:"Update to version 2.2.0p24, 2.3.0b1, 2.4.0b1 or
  later.");

  script_xref(name:"URL", value:"https://checkmk.com/werk/16172");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe: CPE, service: "www" ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
location = infos["location"];

if( version_is_less( version: version, test_version: "2.2.0p24" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.2.0p24", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

if( version_in_range_exclusive( version: version, test_version_lo: "2.3.0", test_version_up: "2.3.0b1" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.3.0b1", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

if( version_in_range_exclusive( version: version, test_version_lo: "2.4.0", test_version_up: "2.4.0b1" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.4.0b1", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
