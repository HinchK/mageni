/**
 * SPDX-License-Identifier: GPL-2.0-or-later
 * SPDX-FileCopyrightText: Copyright (C) Andrew Tridgell 1997-1998
 * SPDX-FileComment: Unix SMB/CIFS implementation. A implementation of MD4 designed for use in the SMB authentication protocol
 * SPDX-FileContributor: Mageni Security LLC
 * 
 */

#include "md4.h"

#include <stdint.h>
#include <string.h>

#ifndef uint32
#define uint32 uint32_t
#endif

static uint32 A, B, C, D;

static uint32
F (uint32 X, uint32 Y, uint32 Z)
{
  return (X & Y) | ((~X) & Z);
}

static uint32
G (uint32 X, uint32 Y, uint32 Z)
{
  return (X & Y) | (X & Z) | (Y & Z);
}

static uint32
H (uint32 X, uint32 Y, uint32 Z)
{
  return X ^ Y ^ Z;
}

static uint32
lshift (uint32 x, int s)
{
  x &= 0xFFFFFFFF;
  return ((x << s) & 0xFFFFFFFF) | (x >> (32 - s));
}

#define ROUND1(a, b, c, d, k, s) a = lshift (a + F (b, c, d) + X[k], s)
#define ROUND2(a, b, c, d, k, s) \
  a = lshift (a + G (b, c, d) + X[k] + (uint32) 0x5A827999, s)
#define ROUND3(a, b, c, d, k, s) \
  a = lshift (a + H (b, c, d) + X[k] + (uint32) 0x6ED9EBA1, s)

/* this applies md4 to 64 byte chunks */
static void
mdfour64_ntlmssp (uint32 *M)
{
  int j;
  uint32 AA, BB, CC, DD;
  uint32 X[16];

  for (j = 0; j < 16; j++)
    X[j] = M[j];

  AA = A;
  BB = B;
  CC = C;
  DD = D;

  ROUND1 (A, B, C, D, 0, 3);
  ROUND1 (D, A, B, C, 1, 7);
  ROUND1 (C, D, A, B, 2, 11);
  ROUND1 (B, C, D, A, 3, 19);
  ROUND1 (A, B, C, D, 4, 3);
  ROUND1 (D, A, B, C, 5, 7);
  ROUND1 (C, D, A, B, 6, 11);
  ROUND1 (B, C, D, A, 7, 19);
  ROUND1 (A, B, C, D, 8, 3);
  ROUND1 (D, A, B, C, 9, 7);
  ROUND1 (C, D, A, B, 10, 11);
  ROUND1 (B, C, D, A, 11, 19);
  ROUND1 (A, B, C, D, 12, 3);
  ROUND1 (D, A, B, C, 13, 7);
  ROUND1 (C, D, A, B, 14, 11);
  ROUND1 (B, C, D, A, 15, 19);

  ROUND2 (A, B, C, D, 0, 3);
  ROUND2 (D, A, B, C, 4, 5);
  ROUND2 (C, D, A, B, 8, 9);
  ROUND2 (B, C, D, A, 12, 13);
  ROUND2 (A, B, C, D, 1, 3);
  ROUND2 (D, A, B, C, 5, 5);
  ROUND2 (C, D, A, B, 9, 9);
  ROUND2 (B, C, D, A, 13, 13);
  ROUND2 (A, B, C, D, 2, 3);
  ROUND2 (D, A, B, C, 6, 5);
  ROUND2 (C, D, A, B, 10, 9);
  ROUND2 (B, C, D, A, 14, 13);
  ROUND2 (A, B, C, D, 3, 3);
  ROUND2 (D, A, B, C, 7, 5);
  ROUND2 (C, D, A, B, 11, 9);
  ROUND2 (B, C, D, A, 15, 13);

  ROUND3 (A, B, C, D, 0, 3);
  ROUND3 (D, A, B, C, 8, 9);
  ROUND3 (C, D, A, B, 4, 11);
  ROUND3 (B, C, D, A, 12, 15);
  ROUND3 (A, B, C, D, 2, 3);
  ROUND3 (D, A, B, C, 10, 9);
  ROUND3 (C, D, A, B, 6, 11);
  ROUND3 (B, C, D, A, 14, 15);
  ROUND3 (A, B, C, D, 1, 3);
  ROUND3 (D, A, B, C, 9, 9);
  ROUND3 (C, D, A, B, 5, 11);
  ROUND3 (B, C, D, A, 13, 15);
  ROUND3 (A, B, C, D, 3, 3);
  ROUND3 (D, A, B, C, 11, 9);
  ROUND3 (C, D, A, B, 7, 11);
  ROUND3 (B, C, D, A, 15, 15);

  A += AA;
  B += BB;
  C += CC;
  D += DD;

  A &= 0xFFFFFFFF;
  B &= 0xFFFFFFFF;
  C &= 0xFFFFFFFF;
  D &= 0xFFFFFFFF;
  memset (X, '\0', sizeof (X));
}

static void
copy64_ntlmssp (uint32 *M, const unsigned char *in)
{
  int i;

  for (i = 0; i < 16; i++)
    M[i] = (in[i * 4 + 3] << 24) | (in[i * 4 + 2] << 16) | (in[i * 4 + 1] << 8)
           | (in[i * 4 + 0] << 0);
}

static void
copy4_ntlmssp (unsigned char *out, uint32 x)
{
  out[0] = x & 0xFF;
  out[1] = (x >> 8) & 0xFF;
  out[2] = (x >> 16) & 0xFF;
  out[3] = (x >> 24) & 0xFF;
}

/* produce a md4 message digest from data of length n bytes */
void
mdfour_ntlmssp (unsigned char *out, const unsigned char *in, int n)
{
  unsigned char buf[128];
  uint32 M[16];
  uint32 b = n * 8;
  int i;

  A = 0x67452301;
  B = 0xefcdab89;
  C = 0x98badcfe;
  D = 0x10325476;

  while (n > 64)
    {
      copy64_ntlmssp (M, in);
      mdfour64_ntlmssp (M);
      in += 64;
      n -= 64;
    }

  for (i = 0; i < 128; i++)
    buf[i] = 0;
  memcpy (buf, in, n);
  buf[n] = 0x80;

  if (n <= 55)
    {
      copy4_ntlmssp (buf + 56, b);
      copy64_ntlmssp (M, buf);
      mdfour64_ntlmssp (M);
    }
  else
    {
      copy4_ntlmssp (buf + 120, b);
      copy64_ntlmssp (M, buf);
      mdfour64_ntlmssp (M);
      copy64_ntlmssp (M, buf + 64);
      mdfour64_ntlmssp (M);
    }

  for (i = 0; i < 128; i++)
    buf[i] = 0;
  copy64_ntlmssp (M, buf);

  copy4_ntlmssp (out, A);
  copy4_ntlmssp (out + 4, B);
  copy4_ntlmssp (out + 8, C);
  copy4_ntlmssp (out + 12, D);

  A = B = C = D = 0;
}
