# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:yikesinc:easy_forms_for_mailchimp";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.127397");
  script_version("2023-04-19T10:08:55+0000");
  script_tag(name:"last_modification", value:"2023-04-19 10:08:55 +0000 (Wed, 19 Apr 2023)");
  script_tag(name:"creation_date", value:"2023-04-18 07:58:56 +0000 (Tue, 18 Apr 2023)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2023-1325");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Easy Forms for Mailchimp Plugin < 6.8.7 XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_wordpress_plugin_http_detect.nasl");
  script_mandatory_keys("wordpress/plugin/yikes-inc-easy-mailchimp-extender/detected");

  script_tag(name:"summary", value:"The WordPress plugin 'Easy Forms for Mailchimp' is prone to a
  cross-site scripting (XSS) vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The plugin does not validate and escape some of its shortcode
  attributes before outputting them back in a page/post where the shortcode is embed.");

  script_tag(name:"affected", value:"WordPress Easy Forms for Mailchimp plugin prior to
  version 6.8.7.");

  script_tag(name:"solution", value:"Update to version 6.8.7 or later.");

  script_xref(name:"URL", value:"https://wpscan.com/vulnerability/5f37cbf3-2388-4582-876c-6a7b0943c2a7");

  exit(0);
}

include( "host_details.inc" );
include( "version_func.inc" );

if( ! port = get_app_port( cpe: CPE ) )
  exit( 0 );

if( ! infos = get_app_version_and_location( cpe: CPE, port: port, exit_no_version: TRUE ) )
  exit( 0 );

version = infos[ "version" ];
location = infos[ "location" ];

if( version_is_less( version: version, test_version: "6.8.7" ) ) {
  report = report_fixed_ver( installed_version: version, fixed_version: "6.8.7", install_path: location );
  security_message( port: port, data: report );
  exit( 0 );
}

exit( 99 );
