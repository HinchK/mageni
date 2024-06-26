# SPDX-FileCopyrightText: 2023 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:qnap:music_station";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.151110");
  script_version("2023-10-13T05:06:10+0000");
  script_tag(name:"last_modification", value:"2023-10-13 05:06:10 +0000 (Fri, 13 Oct 2023)");
  script_tag(name:"creation_date", value:"2023-10-09 03:22:37 +0000 (Mon, 09 Oct 2023)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:N/A:N");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:U/C:H/I:N/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-10-10 19:35:00 +0000 (Tue, 10 Oct 2023)");

  script_cve_id("CVE-2023-23365", "CVE-2023-23366");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("QNAP QTS Music Station Multiple Vulnerabilities (QSA-23-28)");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2023 Greenbone AG");
  script_family("Web application abuses");
  script_dependencies("gb_qnap_nas_musicstation_detect.nasl");
  script_mandatory_keys("qnap_musicstation/detected");

  script_tag(name:"summary", value:"QNAP Music Station is prone to multiple path traversal
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"impact", value:"If exploited, the vulnerabilities could allow authenticated
  users to read the contents of unexpected files and expose sensitive data via a network.");

  script_tag(name:"affected", value:"QNAP Music Station version 5.3.x prior to 5.3.22.");

  script_tag(name:"solution", value:"Update to version 5.3.22 or later.");

  script_xref(name:"URL", value:"https://www.qnap.com/en/security-advisory/qsa-23-28");

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

if (version_in_range_exclusive(version: version, test_version_lo: "5.3.0", test_version_up: "5.3.22")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.3.22", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
