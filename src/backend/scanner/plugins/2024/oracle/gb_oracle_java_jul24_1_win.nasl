# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.834264");
  script_version("2024-07-19T05:05:32+0000");
  script_cve_id("CVE-2024-21144");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2024-07-19 05:05:32 +0000 (Fri, 19 Jul 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:N/A:L");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-07-16 23:15:15 +0000 (Tue, 16 Jul 2024)");
  script_tag(name:"creation_date", value:"2024-07-17 11:51:48 +0530 (Wed, 17 Jul 2024)");
  script_name("Oracle Java SE Security Update (Jul 2024) -1 - Windows");

  script_tag(name:"summary", value:"Oracle Java SE is prone to a denial of service (DoS)
  vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an error in the
  Concurrency component of Oracle Java SE.");

  script_tag(name:"impact", value:"Successful exploitation allows an attacker
  to cause a partial denial of service.");

  script_tag(name:"affected", value:"Oracle Java SE version 8u411 and prior,
  11.0.x through 11.0.23 on Windows.");

  script_tag(name:"solution", value:"The vendor has released updates. Please
  see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"registry");
  script_xref(name:"URL", value:"https://www.oracle.com/security-alerts/cpujul2024.html#AppendixJAVA");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_portable_win.nasl");
  script_mandatory_keys("Sun/Java/JDK_or_JRE/Win/installed");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:oracle:jre";

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE))
  exit(0);

vers = infos["version"];
path = infos["location"];

if(version_in_range(version:vers, test_version:"1.8.0", test_version2:"1.8.0.411") ||
   version_in_range(version:vers, test_version:"11.0", test_version2:"11.0.23")) {
  report = report_fixed_ver(installed_version:vers, fixed_version: "Apply patch provided by the vendor", install_path:path);
  security_message(port:0, data:report);
  exit(0);
}

exit(0);
