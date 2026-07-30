import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure RnaFunctionalEvidence where
  experimentType : String
  supportLevel : ℝ
  pubmedId : String

structure NoncodingRnaFunctionalAnnotationPackage where
  rnaId : String
  functionDescription : String
  evidence : List RnaFunctionalEvidence
  confidenceScore : ℝ
  functionVerified : Prop

structure NoncodingRnaFunctionalAnnotationEvidence
    (F : NoncodingRnaFunctionalAnnotationPackage) where
  evidenceNonempty : F.evidence ≠ []
  confidenceAboveThreshold : F.confidenceScore > 0.5
  functionVerifiedClosed : F.functionVerified

def NoncodingRnaFunctionalAnnotationClosed
    (F : NoncodingRnaFunctionalAnnotationPackage) : Prop :=
  F.evidence ≠ [] ∧ F.confidenceScore > 0.5 ∧ F.functionVerified

theorem noncoding_rna_functional_annotation_closed_from_evidence
    (F : NoncodingRnaFunctionalAnnotationPackage)
    (E : NoncodingRnaFunctionalAnnotationEvidence F) :
    NoncodingRnaFunctionalAnnotationClosed F := by
  exact And.intro E.evidenceNonempty (And.intro E.confidenceAboveThreshold E.functionVerifiedClosed)

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse