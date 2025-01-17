# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:joomla:joomla";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.152911");
  script_version("2024-08-22T05:05:50+0000");
  script_tag(name:"last_modification", value:"2024-08-22 05:05:50 +0000 (Thu, 22 Aug 2024)");
  script_tag(name:"creation_date", value:"2024-08-21 03:14:32 +0000 (Wed, 21 Aug 2024)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_cve_id("CVE-2024-27185", "CVE-2024-40743");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Joomla! Multiple Vulnerabilities (20240802, 20240805)");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("joomla_detect.nasl");
  script_mandatory_keys("joomla/installed");

  script_tag(name:"summary", value:"Joomla! is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The following vulnerabilities exist:

  - CVE-2024-27185: Cache poisoning in pagination

  - CVE-2024-40743: XSS vectors in Outputfilter::strip* methods");

  script_tag(name:"affected", value:"Joomla! version 3.0.0 through 3.10.16, 4.0.0 through 4.4.6 and
  5.0.0 through 5.1.2.");

  script_tag(name:"solution", value:"Update to version 3.10.17, 4.4.7, 5.1.3 or later.");

  script_xref(name:"URL", value:"https://developer.joomla.org/security-centre/942-20240802-core-cache-poisoning-in-pagination.html");
  script_xref(name:"URL", value:"https://developer.joomla.org/security-centre/946-20240805-core-xss-vectors-in-outputfilter-strip-methods.html");

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

if (version_in_range(version: version, test_version: "3.0.0", test_version2: "3.10.16")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.10.17", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "4.0.0", test_version2: "4.4.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.4.7", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

if (version_in_range(version: version, test_version: "5.0.0", test_version2: "5.1.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.1.3", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
