import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure NoncodingRnaFamilyClassificationPackage where
  micrornaFamily : Prop
  lncrnaFamily : Prop
  cirrnaFamily : Prop
  otherNcrnaFamilies : Prop
  conservedMotifs : Prop

structure NoncodingRnaFamilyClassificationEvidence
    (C : NoncodingRnaFamilyClassificationPackage) where
  micrornaFamilyClosed : C.micrornaFamily
  lncrnaFamilyClosed : C.lncrnaFamily
  cirrnaFamilyClosed : C.cirrnaFamily
  otherNcrnaFamiliesClosed : C.otherNcrnaFamilies
  conservedMotifsClosed : C.conservedMotifs

def NoncodingRnaFamilyClassificationClosed
    (C : NoncodingRnaFamilyClassificationPackage) : Prop :=
  C.micrornaFamily ∧ C.lncrnaFamily ∧ C.cirrnaFamily ∧ C.otherNcrnaFamilies ∧ C.conservedMotifs

theorem noncoding_rna_family_classification_closed_from_evidence
    (C : NoncodingRnaFamilyClassificationPackage)
    (E : NoncodingRnaFamilyClassificationEvidence C) :
    NoncodingRnaFamilyClassificationClosed C := by
  exact And.intro E.micrornaFamilyClosed
    (And.intro E.lncrnaFamilyClosed
      (And.intro E.cirrnaFamilyClosed
        (And.intro E.otherNcrnaFamiliesClosed E.conservedMotifsClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse