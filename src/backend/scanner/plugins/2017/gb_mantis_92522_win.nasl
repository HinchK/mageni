###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mantis_92522_win.nasl 12818 2018-12-18 09:55:03Z ckuersteiner $
#
# MantisBT 'view_type' Cross Site Scripting Vulnerability (Windows)
#
# Authors:
# Christian Fischer <christian.fischer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:mantisbt:mantisbt";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.108050");
  script_version("$Revision: 12818 $");
  script_cve_id("CVE-2016-6837");
  script_bugtraq_id(92522);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-12-18 10:55:03 +0100 (Tue, 18 Dec 2018) $");
  script_tag(name:"creation_date", value:"2017-01-23 14:57:33 +0100 (Mon, 23 Jan 2017)");

  script_name("MantisBT 'view_type' Cross Site Scripting Vulnerability (Windows)");

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("mantis_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("mantisbt/detected", "Host/runs_windows");
  script_require_ports("Services/www", 80);

  script_xref(name:"URL", value:"https://mantisbt.org/bugs/view.php?id=21611");

  script_tag(name:"summary", value:"This host is installed with MantisBT
  and is prone to a cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"impact", value:"Successfully exploitation will allow remote
  attacker to execute arbitrary script code in the browser of an unsuspecting user
  in the context of the affected site. This may allow the attacker to steal
  cookie-based authentication credentials and to launch other attacks.");

  script_tag(name:"affected", value:"MantisBT versions before 1.2.19, and versions 2.0.0-beta1, 1.3.0-beta1");

  script_tag(name:"solution", value:"Update to MantisBT 1.2.19, 1.3.1 or 2.0.0-beta2.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( ! port = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"1.2.19" ) ) {
  vuln = TRUE;
  fix = "1.2.19";
}

if( vers =~ "^1\.3" ) {
  if( version_is_less( version:vers, test_version:"1.3.1" ) ) {
    vuln = TRUE;
    fix = "1.3.1";
  }
}

if( vers =~ "^2\.0" ) {
  if( version_is_less( version:vers, test_version:"2.0.0-beta.2" ) ) {
    vuln = TRUE;
    fix = "2.0.0-beta.2";
  }
}

if( vuln ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:fix );
  security_message( port:port, data:report );
  exit( 0 );
}

exit( 99 );
