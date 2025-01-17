# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.834670");
  script_version("2024-10-17T08:02:35+0000");
  script_cve_id("CVE-2024-9680");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2024-10-17 08:02:35 +0000 (Thu, 17 Oct 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-10-16 15:07:36 +0000 (Wed, 16 Oct 2024)");
  script_tag(name:"creation_date", value:"2024-10-10 11:16:07 +0530 (Thu, 10 Oct 2024)");
  script_name("Mozilla Firefox Security Update (mfsa_2024-51) - Mac OS X");

  script_tag(name:"summary", value:"Mozilla Firefox is prone to an use after
  free vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name:"insight", value:"The flaw exists due to an use after free
  error in Animation timelines.");

  script_tag(name:"impact", value:"Successful exploitation allows an attacker
  to achieve code execution in the content process.");

  script_tag(name:"affected", value:"Mozilla Firefox proir to version 131.0.2 on
  Mac OS X.");

  script_tag(name:"solution", value:"Update to version 131.0.2 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"executable_version");
  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2024-51/");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!infos = get_app_version_and_location(cpe:CPE, exit_no_version:TRUE))
  exit(0);

vers = infos["version"];
path = infos["location"];

if(version_is_less(version:vers, test_version:"131.0.2")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"131.0.2", install_path:path);
  security_message(port:0, data:report);
  exit(0);
}

exit(99);
