# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:givewp:givewp";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.127803");
  script_version("2024-09-03T06:26:22+0000");
  script_tag(name:"last_modification", value:"2024-09-03 06:26:22 +0000 (Tue, 03 Sep 2024)");
  script_tag(name:"creation_date", value:"2024-08-30 09:50:07 +0000 (Fri, 30 Aug 2024)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-08-26 18:34:13 +0000 (Mon, 26 Aug 2024)");

  script_cve_id("CVE-2024-5932");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress GiveWP Plugin < 3.14.2 PHP Object Injection Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_wordpress_plugin_http_detect.nasl");
  script_mandatory_keys("wordpress/plugin/give/detected");

  script_tag(name:"summary", value:"The WordPress plugin 'GiveWP' is prone to a PHP object
  injection vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Unauthenticated attackers are able to inject a PHP Object due
  to deserialization of untrusted input from the 'give_title' parameter.");

  script_tag(name:"affected", value:"WordPress GiveWP plugin prior to version 3.14.2.");

  script_tag(name:"solution", value:"Update to version 3.14.2 or later.");

  script_xref(name:"URL", value:"https://www.wordfence.com/threat-intel/vulnerabilities/wordpress-plugins/give/givewp-donation-plugin-and-fundraising-platform-3141-unauthenticated-php-object-injection-to-remote-code-execution");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
location = infos["location"];

if( version_is_less( version: version, test_version: "3.14.2" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "3.14.2", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );