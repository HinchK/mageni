# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.856362");
  script_version("2024-08-23T05:05:37+0000");
  script_cve_id("CVE-2024-5535");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2024-08-23 05:05:37 +0000 (Fri, 23 Aug 2024)");
  script_tag(name:"creation_date", value:"2024-08-20 04:05:31 +0000 (Tue, 20 Aug 2024)");
  script_name("openSUSE: Security Advisory for openssl (SUSE-SU-2024:2933-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.6");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:2933-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/CHUXBPTNN2FMPS3ZXDMDWJWW7NLTXWXV");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'openssl'
  package(s) announced via the SUSE-SU-2024:2933-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for openssl-1_1 fixes the following issues:

  * CVE-2024-5535: Fixed a buffer overread in function SSL_select_next_proto()
      with an empty supported client protocols buffer (bsc#1227138)

  Other fixes: \- Build with no-afalgeng. (bsc#1226463) \- Fixed C99 violations to
  allow the package to build with GCC 14. (bsc#1225907)

  ##");

  script_tag(name:"affected", value:"'openssl' package(s) on openSUSE Leap 15.6.");

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

if(release == "openSUSELeap15.6") {

  if(!isnull(res = isrpmvuln(pkg:"libopenssl-1_1-devel", rpm:"libopenssl-1_1-devel~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1-debuginfo", rpm:"libopenssl1_1-debuginfo~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"openssl-1_1", rpm:"openssl-1_1~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1", rpm:"libopenssl1_1~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"openssl-1_1-debugsource", rpm:"openssl-1_1-debugsource~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"openssl-1_1-debuginfo", rpm:"openssl-1_1-debuginfo~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1-32bit", rpm:"libopenssl1_1-32bit~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1-32bit-debuginfo", rpm:"libopenssl1_1-32bit-debuginfo~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl-1_1-devel-32bit", rpm:"libopenssl-1_1-devel-32bit~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"openssl-1_1-doc", rpm:"openssl-1_1-doc~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1-64bit-debuginfo", rpm:"libopenssl1_1-64bit-debuginfo~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl1_1-64bit", rpm:"libopenssl1_1-64bit~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libopenssl-1_1-devel-64bit", rpm:"libopenssl-1_1-devel-64bit~1.1.1w~150600.5.6.1", rls:"openSUSELeap15.6"))) {
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