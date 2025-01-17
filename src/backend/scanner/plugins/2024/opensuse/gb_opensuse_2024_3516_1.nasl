# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.856525");
  script_version("2024-10-10T07:25:31+0000");
  script_cve_id("CVE-2023-7256", "CVE-2024-8006");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:M/C:N/I:N/A:C");
  script_tag(name:"last_modification", value:"2024-10-10 07:25:31 +0000 (Thu, 10 Oct 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:L/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2024-09-19 17:46:03 +0000 (Thu, 19 Sep 2024)");
  script_tag(name:"creation_date", value:"2024-10-04 04:00:27 +0000 (Fri, 04 Oct 2024)");
  script_name("openSUSE: Security Advisory for libpcap (SUSE-SU-2024:3516-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.3");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3516-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/KG72VRBX2FF2X6MXJ3X7QUX6SWOR2OAR");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'libpcap'
  package(s) announced via the SUSE-SU-2024:3516-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for libpcap fixes the following issues:

  * CVE-2024-8006: NULL pointer dereference in function pcap_findalldevs_ex().
      (bsc#1230034)

  * CVE-2023-7256: double free via struct addrinfo in function
      sock_initaddress(). (bsc#1230020)");

  script_tag(name:"affected", value:"'libpcap' package(s) on openSUSE Leap 15.3.");

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

  if(!isnull(res = isrpmvuln(pkg:"libpcap-devel-static", rpm:"libpcap-devel-static~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1-debuginfo", rpm:"libpcap1-debuginfo~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap-debugsource", rpm:"libpcap-debugsource~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1", rpm:"libpcap1~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap-devel", rpm:"libpcap-devel~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap-devel-32bit", rpm:"libpcap-devel-32bit~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1-32bit-debuginfo", rpm:"libpcap1-32bit-debuginfo~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1-32bit", rpm:"libpcap1-32bit~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap-devel-64bit", rpm:"libpcap-devel-64bit~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1-64bit-debuginfo", rpm:"libpcap1-64bit-debuginfo~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpcap1-64bit", rpm:"libpcap1-64bit~1.9.1~150300.3.3.1", rls:"openSUSELeap15.3"))) {
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