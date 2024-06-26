# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:yarpp:yet_another_related_posts_plugin";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.124403");
  script_version("2023-08-22T05:06:00+0000");
  script_tag(name:"last_modification", value:"2023-08-22 05:06:00 +0000 (Tue, 22 Aug 2023)");
  script_tag(name:"creation_date", value:"2023-08-17 08:44:07 +0000 (Thu, 17 Aug 2023)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2023-0579");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress YARPP Plugin < 5.30.3 SQLi Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_wordpress_plugin_http_detect.nasl");
  script_mandatory_keys("wordpress/plugin/yet-another-related-posts-plugin/detected");

  script_tag(name:"summary", value:"The WordPress plugin 'YARPP' is prone to a SQL injection
  (SQLi) vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The plugin does not validate and escape some of its shortcode
  attributes before using them in SQL statement/s, which could allow any authenticated users, such
  as subscribers to perform SQL Injection attacks.");

  script_tag(name:"affected", value:"WordPress YARPP plugin prior to version 5.30.3.");

  script_tag(name:"solution", value:"Update to version 5.30.3 or later.");

  script_xref(name:"URL", value:"https://wpscan.com/vulnerability/574f7607-96d8-4ef8-b96c-0425ad7e7690");

  exit(0);
}

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos["version"];
location = infos["location"];

if( version_is_less( version: version, test_version: "5.30.3" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "5.30.3", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
