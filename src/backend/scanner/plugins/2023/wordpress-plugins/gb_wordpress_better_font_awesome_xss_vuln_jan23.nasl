# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:better_font_awesome_project:better_font_awesome";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.126438");
  script_version("2024-04-26T15:38:47+0000");
  script_tag(name:"last_modification", value:"2024-04-26 15:38:47 +0000 (Fri, 26 Apr 2024)");
  script_tag(name:"creation_date", value:"2023-07-21 10:00:48 +0000 (Fri, 21 Jul 2023)");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:L/UI:R/S:C/C:L/I:L/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-02-23 04:45:00 +0000 (Thu, 23 Feb 2023)");

  script_cve_id("CVE-2022-4512");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Better Font Awesome Plugin < 2.0.4 XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_wordpress_plugin_http_detect.nasl");
  script_mandatory_keys("wordpress/plugin/better-font-awesome/detected");

  script_tag(name:"summary", value:"The WordPress plugin 'Better Font Awesome' is prone
  to a cross-site scripting (XSS) vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The plugin does not validate and escape some of its shortcode
  attributes before outputting them back in a page/post where the shortcode is embed, which could
  allow users with the contributor role and above to perform Stored Cross-Site Scripting attack.");

  script_tag(name:"affected", value:"WordPress Better Font Awesome plugin prior to version
  2.0.4.");

  script_tag(name:"solution", value:"Update to version 2.0.4 or later.");

  script_xref(name:"URL", value:"https://wpscan.com/vulnerability/7957f355-c767-4f59-bb28-0302d33386a6");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
location = infos["location"];

if( version_is_less( version: version, test_version: "2.0.4" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "2.0.4", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
