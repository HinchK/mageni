# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.3770.1");
  script_cve_id("CVE-2016-9888", "CVE-2024-36474", "CVE-2024-42415");
  script_tag(name:"creation_date", value:"2024-10-30 04:17:20 +0000 (Wed, 30 Oct 2024)");
  script_version("2024-10-31T05:05:48+0000");
  script_tag(name:"last_modification", value:"2024-10-31 05:05:48 +0000 (Thu, 31 Oct 2024)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-10-09 16:44:20 +0000 (Wed, 09 Oct 2024)");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:3770-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES12\.0SP5)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3770-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20243770-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libgsf' package(s) announced via the SUSE-SU-2024:3770-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for libgsf fixes the following issues:

CVE-2016-9888: Fixed null pointer dereference with corrupted tar files (bsc#1014609)
CVE-2024-36474: Fixed out-of-bounds index when processing a directory via an integer overflow in the compound document binary file format parser (bsc#1231282)
CVE-2024-42415: Fixed heap-based buffer overflow when processing the sector allocation table via an integer overflow in the compound document binary file format parser (bsc#1231283)");

  script_tag(name:"affected", value:"'libgsf' package(s) on SUSE Linux Enterprise Server 12-SP5.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "SLES12.0SP5") {

  if(!isnull(res = isrpmvuln(pkg:"libgsf-1-114", rpm:"libgsf-1-114~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsf-1-114-32bit", rpm:"libgsf-1-114-32bit~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsf-1-114-debuginfo", rpm:"libgsf-1-114-debuginfo~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsf-1-114-debuginfo-32bit", rpm:"libgsf-1-114-debuginfo-32bit~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsf-debugsource", rpm:"libgsf-debugsource~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsf-lang", rpm:"libgsf-lang~1.14.40~8.3.1", rls:"SLES12.0SP5"))) {
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
