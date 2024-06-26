# Copyright (C) 2023 Greenbone Networks GmbH
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

CPE = "cpe:/a:spip:spip";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.170330");
  script_version("2023-03-03T10:59:40+0000");
  script_tag(name:"last_modification", value:"2023-03-03 10:59:40 +0000 (Fri, 03 Mar 2023)");
  script_tag(name:"creation_date", value:"2023-03-02 13:24:03 +0000 (Thu, 02 Mar 2023)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");

  script_cve_id("CVE-2023-24258");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("SPIP 3.2.x < 3.2.17, 4.x < 4.0.9, 4.1.x < 4.1.7 SQLi Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2023 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_spip_http_detect.nasl");
  script_mandatory_keys("spip/detected");

  script_tag(name:"summary", value:"SPIP is prone to an SQL injection (SQLi) vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"SQL injection vulnerability via the _oups parameter allows
  attackers to execute arbitrary code via a crafted POST request.");

  script_tag(name:"affected", value:"SPIP version 3.2.x prior to 3.2.17, 4.x prior to 4.0.9 and 4.1.x
  prior to 4.1.7.");

  script_tag(name:"solution", value:"Update to version 3.2.17, 4.0.9, 4.1.7 or later.");

  script_xref(name:"URL", value:"https://blog.spip.net/Mise-a-jour-de-securite-sortie-de-SPIP-4-1-7-SPIP-4-0-9-et-SPIP-3-2-17.html?lang=fr");
  script_xref(name:"URL", value:"https://github.com/Abyss-W4tcher/ab4yss-wr4iteups/blob/ffa980faa9e3598d49d6fb7def4f7a67cfb5f427/SPIP%20-%20Pentest/SPIP%204.1.5/SPIP_4.1.5_AND_BEFORE_AUTH_SQLi_Abyss_Watcher.md");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version = infos["version"];
location = infos["location"];

if (version_in_range_exclusive(version: version, test_version_lo: "3.2.0", test_version_up: "3.2.17")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.2.17", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range_exclusive(version: version, test_version_lo: "4.0.0", test_version_up: "4.0.9")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.0.9", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range_exclusive(version: version, test_version_lo: "4.1.0", test_version_up: "4.1.7")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.1.7", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
