import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure ExpressionSample where
  sampleId : String
  readCount : ℕ
  normalizedCount : ℝ

struct NoncodingRnaExpressionQuantificationPackage where
  rnaId : String
  samples : List ExpressionSample
  meanExpression : ℝ
  expressionDetected : Prop

structure NoncodingRnaExpressionQuantificationEvidence
    (Q : NoncodingRnaExpressionQuantificationPackage) where
  samplesNonempty : Q.samples ≠ []
  meanExpressionAboveThreshold : Q.meanExpression > 0
  expressionDetectedClosed : Q.expressionDetected

def NoncodingRnaExpressionQuantificationClosed
    (Q : NoncodingRnaExpressionQuantificationPackage) : Prop :=
  Q.samples ≠ [] ∧ Q.meanExpression > 0 ∧ Q.expressionDetected

theorem noncoding_rna_expression_quantification_closed_from_evidence
    (Q : NoncodingRnaExpressionQuantificationPackage)
    (E : NoncodingRnaExpressionQuantificationEvidence Q) :
    NoncodingRnaExpressionQuantificationClosed Q := by
  exact And.intro E.samplesNonempty (And.intro E.meanExpressionAboveThreshold E.expressionDetectedClosed)

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse