# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:discourse:discourse";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.152549");
  script_version("2024-09-19T05:05:57+0000");
  script_tag(name:"last_modification", value:"2024-09-19 05:05:57 +0000 (Thu, 19 Sep 2024)");
  script_tag(name:"creation_date", value:"2024-07-04 03:02:49 +0000 (Thu, 04 Jul 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:L/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-09-18 13:50:23 +0000 (Wed, 18 Sep 2024)");

  script_cve_id("CVE-2024-36122", "CVE-2024-37157");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Discourse 3.3.x - 3.3.0.beta4 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("General");
  script_dependencies("gb_discourse_detect.nasl");
  script_mandatory_keys("discourse/detected");

  script_tag(name:"summary", value:"Discourse is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The following vulnerabilities exist:

  - CVE-2024-36122: Limit reviewable user serializer payload

  - CVE-2024-37157: SSRF via FastImage");

  script_tag(name:"affected", value:"Discourse versions 3.3.x through 3.3.0.beta3.");

  script_tag(name:"solution", value:"Update to version 3.3.0.beta4 or later.");

  script_xref(name:"URL", value:"https://github.com/discourse/discourse/security/advisories/GHSA-rr93-hcw4-cv3f");
  script_xref(name:"URL", value:"https://github.com/discourse/discourse/security/advisories/GHSA-46pq-7958-fc68");

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

if (version_in_range(version: version, test_version: "3.3.0.beta", test_version2: "3.3.0.beta3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "3.3.0.beta4", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
