# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:moodle:moodle";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.131087");
  script_version("2024-10-29T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-10-29 05:05:46 +0000 (Tue, 29 Oct 2024)");
  script_tag(name:"creation_date", value:"2024-10-28 08:51:16 +0000 (Mon, 28 Oct 2024)");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");

  script_cve_id("CVE-2024-48899", "CVE-2024-48900");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Moodle 4.4.x < 4.4.4 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_moodle_cms_detect.nasl");
  script_mandatory_keys("moodle/detected");

  script_tag(name:"summary", value:"Moodle is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The following vulnerabilities exist:

  - CVE-2024-48899 / MSA-24-0048: Insufficient checks to ensure users can only fetch the list of
  course badges for courses they are intended to have access to.

  - CVE-2024-48900 / MSA-24-0049: Insufficient checks to ensure users with permission to view
  badge recipients can only access lists of those they are intended to have access to.");

  script_tag(name:"affected", value:"Moodle version 4.4.x prior to 4.4.4.");

  script_tag(name:"solution", value:"Update to version 4.4.4 or later.");

  script_xref(name:"URL", value:"https://moodle.org/mod/forum/discuss.php?d=462878");
  script_xref(name:"URL", value:"https://moodle.org/mod/forum/discuss.php?d=462879");

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

if (version_in_range_exclusive(version: version, test_version_lo: "4.4.0", test_version_up: "4.4.4")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "4.4.4", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);

