; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mattr=+avx512vbmi | FileCheck %s

declare <64 x i8> @llvm.x86.avx512.permvar.qi.512(<64 x i8>, <64 x i8>)

define <64 x i8>@test_int_x86_avx512_mask_permvar_qi_512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_permvar_qi_512:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    vpermb %zmm0, %zmm1, %zmm3
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpermb %zmm0, %zmm1, %zmm2 {%k1}
; CHECK-NEXT:    vpermb %zmm0, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    vpaddb %zmm3, %zmm0, %zmm0
; CHECK-NEXT:    vpaddb %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %1 = call <64 x i8> @llvm.x86.avx512.permvar.qi.512(<64 x i8> %x0, <64 x i8> %x1)
  %2 = bitcast i64 %x3 to <64 x i1>
  %3 = select <64 x i1> %2, <64 x i8> %1, <64 x i8> %x2
  %4 = call <64 x i8> @llvm.x86.avx512.permvar.qi.512(<64 x i8> %x0, <64 x i8> %x1)
  %5 = bitcast i64 %x3 to <64 x i1>
  %6 = select <64 x i1> %5, <64 x i8> %4, <64 x i8> zeroinitializer
  %7 = call <64 x i8> @llvm.x86.avx512.permvar.qi.512(<64 x i8> %x0, <64 x i8> %x1)
  %res3 = add <64 x i8> %3, %6
  %res4 = add <64 x i8> %res3, %7
  ret <64 x i8> %res4
}

declare <64 x i8> @llvm.x86.avx512.mask.pmultishift.qb.512(<64 x i8>, <64 x i8>, <64 x i8>, i64)

define <64 x i8>@test_int_x86_avx512_mask_pmultishift_qb_512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_pmultishift_qb_512:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpmultishiftqb %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpmultishiftqb %zmm1, %zmm0, %zmm3 {%k1} {z}
; CHECK-NEXT:    vpmultishiftqb %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddb %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    vpaddb %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <64 x i8> @llvm.x86.avx512.mask.pmultishift.qb.512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3)
  %res1 = call <64 x i8> @llvm.x86.avx512.mask.pmultishift.qb.512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> zeroinitializer, i64 %x3)
  %res2 = call <64 x i8> @llvm.x86.avx512.mask.pmultishift.qb.512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 -1)
  %res3 = add <64 x i8> %res, %res1
  %res4 = add <64 x i8> %res3, %res2
  ret <64 x i8> %res4
}

declare <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8>, <64 x i8>, <64 x i8>)

define <64 x i8>@test_int_x86_avx512_mask_vpermi2var_qi_512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpermi2var_qi_512:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpermt2b %zmm2, %zmm1, %zmm3
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpermi2b %zmm2, %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vpxor %xmm4, %xmm4, %xmm4
; CHECK-NEXT:    vpermi2b %zmm2, %zmm0, %zmm4 {%k1} {z}
; CHECK-NEXT:    vpaddb %zmm3, %zmm4, %zmm0
; CHECK-NEXT:    vpaddb %zmm0, %zmm1, %zmm0
; CHECK-NEXT:    retq
  %1 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2)
  %2 = bitcast i64 %x3 to <64 x i1>
  %3 = select <64 x i1> %2, <64 x i8> %1, <64 x i8> %x1
  %4 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x0, <64 x i8> zeroinitializer, <64 x i8> %x2)
  %5 = bitcast i64 %x3 to <64 x i1>
  %6 = select <64 x i1> %5, <64 x i8> %4, <64 x i8> zeroinitializer
  %7 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2)
  %res3 = add <64 x i8> %3, %6
  %res4 = add <64 x i8> %res3, %7
  ret <64 x i8> %res4
}

define <64 x i8>@test_int_x86_avx512_mask_vpermt2var_qi_512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpermt2var_qi_512:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    vmovdqa64 %zmm1, %zmm3
; CHECK-NEXT:    vpermt2b %zmm2, %zmm0, %zmm3
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpermt2b %zmm2, %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vpxor %xmm4, %xmm4, %xmm4
; CHECK-NEXT:    vpermt2b %zmm2, %zmm0, %zmm4 {%k1} {z}
; CHECK-NEXT:    vpaddb %zmm3, %zmm4, %zmm0
; CHECK-NEXT:    vpaddb %zmm0, %zmm1, %zmm0
; CHECK-NEXT:    ret
  %1 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x1, <64 x i8> %x0, <64 x i8> %x2)
  %2 = bitcast i64 %x3 to <64 x i1>
  %3 = select <64 x i1> %2, <64 x i8> %1, <64 x i8> %x1
  %4 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> zeroinitializer, <64 x i8> %x0, <64 x i8> %x2)
  %5 = bitcast i64 %x3 to <64 x i1>
  %6 = select <64 x i1> %5, <64 x i8> %4, <64 x i8> zeroinitializer
  %7 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x1, <64 x i8> %x0, <64 x i8> %x2)
  %res3 = add <64 x i8> %3, %6
  %res4 = add <64 x i8> %res3, %7
  ret <64 x i8> %res4
}

define <64 x i8>@test_int_x86_avx512_maskz_vpermt2var_qi_512(<64 x i8> %x0, <64 x i8> %x1, <64 x i8> %x2, i64 %x3) {
; CHECK-LABEL: test_int_x86_avx512_maskz_vpermt2var_qi_512:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpermi2b %zmm2, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    retq
  %1 = call <64 x i8> @llvm.x86.avx512.vpermi2var.qi.512(<64 x i8> %x1, <64 x i8> %x0, <64 x i8> %x2)
  %2 = bitcast i64 %x3 to <64 x i1>
  %3 = select <64 x i1> %2, <64 x i8> %1, <64 x i8> zeroinitializer
  ret <64 x i8> %3
}
