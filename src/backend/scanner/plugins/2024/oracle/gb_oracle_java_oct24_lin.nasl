# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.834687");
  script_version("2024-10-18T15:39:59+0000");
  script_cve_id("CVE-2024-21235", "CVE-2024-21210", "CVE-2024-21208", "CVE-2024-21217");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"2024-10-18 15:39:59 +0000 (Fri, 18 Oct 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:N");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-10-15 20:15:12 +0000 (Tue, 15 Oct 2024)");
  script_tag(name:"creation_date", value:"2024-10-16 11:24:51 +0530 (Wed, 16 Oct 2024)");
  script_name("Oracle Java SE Security Update (Oct24) - Linux");

  script_tag(name:"summary", value:"Oracle Java SE is prone to multiple
  vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"These vulnerabilities exist:

  - CVE-2024-21235: An error in the Hotspot component of Oracle Java SE.

  - CVE-2024-21210: An error in the Hotspot component of Oracle Java SE.

  - CVE-2024-21208: An error in the Networking component of Oracle Java SE.

  - CVE-2024-21217: An error in the Serialization component of Oracle Java SE.");

  script_tag(name:"impact", value:"Successful exploitation allows an attacker
  to disclose information and cause partial denial of service attacks.");

  script_tag(name:"affected", value:"Oracle Java SE version 8u421 and prior,
  17.0.x through 17.0.12, 11.0.x through 11.0.24, 21.0.x through 21.0.4 and
  23 on Linux.");

  script_tag(name:"solution", value:"The vendor has released updates. Please
  see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.oracle.com/security-alerts/cpuoct2024.html#AppendixJAVA");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("General");
  script_dependencies("gb_java_prdts_detect_lin.nasl");
  script_mandatory_keys("Oracle/Java/JDK_or_JRE/Linux/detected");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

CPE = "cpe:/a:oracle:jre";

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE))
  exit(0);

vers = infos["version"];
path = infos["location"];

if(version_in_range(version:vers, test_version:"1.8.0", test_version2:"1.8.0.421") ||
   version_in_range(version:vers, test_version:"11.0", test_version2:"11.0.24") ||
   version_in_range(version:vers, test_version:"17.0", test_version2:"17.0.12") ||
   version_in_range(version:vers, test_version:"21.0", test_version2:"21.0.4") ||
   version_is_equal(version:vers, test_version:"23")) {
  report = report_fixed_ver(installed_version:vers, fixed_version: "Apply patch provided by the vendor", install_path:path);
  security_message(port:0, data:report);
  exit(0);
}

exit(0);
