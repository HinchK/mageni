# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.12.2024.7057.2");
  script_cve_id("CVE-2024-47220");
  script_tag(name:"creation_date", value:"2024-10-09 04:07:49 +0000 (Wed, 09 Oct 2024)");
  script_version("2024-10-09T08:09:35+0000");
  script_tag(name:"last_modification", value:"2024-10-09 08:09:35 +0000 (Wed, 09 Oct 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Ubuntu: Security Advisory (USN-7057-2)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU22\.04\ LTS");

  script_xref(name:"Advisory-ID", value:"USN-7057-2");
  script_xref(name:"URL", value:"https://ubuntu.com/security/notices/USN-7057-2");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'ruby-webrick' package(s) announced via the USN-7057-2 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"USN-7057-1 fixed a vulnerability in WEBrick. This update provides the
corresponding updates for Ubuntu 22.04 LTS.

Original advisory details:

 It was discovered that WEBrick incorrectly handled having both a Content-
 Length header and a Transfer-Encoding header. A remote attacker could
 possibly use this issue to perform a HTTP request smuggling attack.");

  script_tag(name:"affected", value:"'ruby-webrick' package(s) on Ubuntu 22.04.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "UBUNTU22.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"ruby-webrick", ver:"1.7.0-3ubuntu0.1", rls:"UBUNTU22.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
