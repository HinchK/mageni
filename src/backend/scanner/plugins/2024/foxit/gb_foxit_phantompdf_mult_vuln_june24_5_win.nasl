# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:foxitsoftware:phantompdf";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.834089");
  script_version("2024-06-26T05:05:39+0000");
  script_cve_id("CVE-2023-42089", "CVE-2023-42090", "CVE-2023-42091", "CVE-2023-42092",
                "CVE-2023-42093", "CVE-2023-42094", "CVE-2023-42095", "CVE-2023-42096",
                "CVE-2023-42097", "CVE-2023-42098", "CVE-2023-39542");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2024-06-26 05:05:39 +0000 (Wed, 26 Jun 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-11-27 16:15:10 +0000 (Mon, 27 Nov 2023)");
  script_tag(name:"creation_date", value:"2024-06-21 11:16:04 +0530 (Fri, 21 Jun 2024)");
  script_name("Foxit PhantomPDF Multiple Vulnerabilities (June-5 2024)");

  script_tag(name:"summary", value:"Foxit PhantomPDF is prone to multiple
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"These vulnerabilities exist:

  - CVE-2023-39542: A remote code execution vulnerability when handling certain JavaScripts.

  - CVE-2023-42089: An use-after-free vulnerability and crash when handling certain JavaScripts.");

  script_tag(name:"impact", value:"Successful exploitation allows an attacker
  to execute remote code and disclose information.");

  script_tag(name:"affected", value:"Foxit PhantomPDF version 2023.1.0.15510,
  12.x through 12.1.3.15356, 11.x through 11.2.7.53812, 10.1.12.37872 and prior
  on Windows.");

  script_tag(name:"solution", value:"Update to version 11.2.8 or 12.1.4 or
  2023.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.foxitsoftware.com/support/security-bulletins.php");
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_foxit_phantom_reader_detect.nasl");
  script_mandatory_keys("foxit/phantompdf/ver");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE)) exit(0);

vers = infos["version"];
path = infos["location"];

if(version_is_equal(version:vers, test_version:"2023.1.0.15510")) {
  fix = "2023.2";
}

if(version_in_range(version:vers, test_version:"11.0", test_version2:"11.2.7.53812") ||
   version_is_less_equal(version:vers, test_version:"10.1.12.37872")) {
  fix = "11.2.8";
}

if(version_in_range(version:vers, test_version:"12.0", test_version2:"12.1.3.15356")) {
  fix = "12.1.4";
}

if(fix) {
  report = report_fixed_ver(installed_version:vers, fixed_version:fix, install_path:path);
  security_message(port:0, data:report);
  exit(0);
}

exit(99);

