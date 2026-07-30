import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaTranscriptomeAnnotationPackage where
  transcriptomeAssembly : Prop
  noncodingRnaAnnotation : Prop
  expressionProfiles : Prop
  functionalPrediction : Prop

structure RnaTranscriptomeAnnotationEvidence (R : RnaTranscriptomeAnnotationPackage) where
  transcriptomeAssemblyClosed : R.transcriptomeAssembly
  noncodingRnaAnnotationClosed : R.noncodingRnaAnnotation
  expressionProfilesClosed : R.expressionProfiles
  functionalPredictionClosed : R.functionalPrediction

def RnaTranscriptomeAnnotationClosed (R : RnaTranscriptomeAnnotationPackage) : Prop :=
  R.transcriptomeAssembly ∧ R.noncodingRnaAnnotation ∧ R.expressionProfiles ∧ R.functionalPrediction

theorem rna_transcriptome_annotation_closed_from_evidence
    (R : RnaTranscriptomeAnnotationPackage) (E : RnaTranscriptomeAnnotationEvidence R) :
    RnaTranscriptomeAnnotationClosed R := by
  exact And.intro E.transcriptomeAssemblyClosed
    (And.intro E.noncodingRnaAnnotationClosed
      (And.intro E.expressionProfilesClosed E.functionalPredictionClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse