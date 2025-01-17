# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.856479");
  script_version("2024-09-25T05:06:11+0000");
  script_cve_id("CVE-2024-2199", "CVE-2024-3657", "CVE-2024-5953");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-09-25 05:06:11 +0000 (Wed, 25 Sep 2024)");
  script_tag(name:"creation_date", value:"2024-09-18 04:00:23 +0000 (Wed, 18 Sep 2024)");
  script_name("openSUSE: Security Advisory for 389 (SUSE-SU-2024:3257-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.3");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3257-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/PKYCUUQTMSQJAYNUKCXTOO6BYZAZTELN");

  script_tag(name:"summary", value:"The remote host is missing an update for the '389'
  package(s) announced via the SUSE-SU-2024:3257-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for 389-ds fixes the following issues:

  * Update to version 1.4.4.20~git3.e7ac6d87:

  * CVE-2024-3657: DOS via via specially crafted kerberos AS-REQ request.
      (bsc#1225512)

  * CVE-2024-5953: Malformed userPassword hashes may cause a denial of service.
      (bsc#1226277)

  * CVE-2024-2199: Malformed userPassword may cause crash at do_modify in
      slapd/modify.c. (bsc#1225507)

  ##");

  script_tag(name:"affected", value:"'389' package(s) on openSUSE Leap 15.3.");

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

if(release == "openSUSELeap15.3") {

  if(!isnull(res = isrpmvuln(pkg:"libsvrcore0", rpm:"libsvrcore0~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds-snmp-debuginfo", rpm:"389-ds-snmp-debuginfo~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libsvrcore0-debuginfo", rpm:"libsvrcore0-debuginfo~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds-devel", rpm:"389-ds-devel~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds", rpm:"389-ds~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds-snmp", rpm:"389-ds-snmp~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds-debuginfo", rpm:"389-ds-debuginfo~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"lib389", rpm:"lib389~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"389-ds-debugsource", rpm:"389-ds-debugsource~1.4.4.20~git3.e7ac6d87~150300.3.35.1", rls:"openSUSELeap15.3"))) {
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