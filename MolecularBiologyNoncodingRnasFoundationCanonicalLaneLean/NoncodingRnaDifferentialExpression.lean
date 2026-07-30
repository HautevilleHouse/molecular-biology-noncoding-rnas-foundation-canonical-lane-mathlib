import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundation

structure DifferentialExpressionCondition where
  conditionLabel : String
  expressionValues : List ℝ
  sampleSize : ℕ

structure NoncodingRnaDifferentialExpressionPackage where
  conditionA : DifferentialExpressionCondition
  conditionB : DifferentialExpressionCondition
  foldChange : ℝ
  pValue : ℝ
  significant : Prop

structure NoncodingRnaDifferentialExpressionEvidence
    (D : NoncodingRnaDifferentialExpressionPackage) where
  foldChangeComputed : D.foldChange > 0
  pValueBelowThreshold : D.pValue < 0.05
  significantClosed : D.significant

def NoncodingRnaDifferentialExpressionClosed
    (D : NoncodingRnaDifferentialExpressionPackage) : Prop :=
  D.foldChange > 0 ∧ D.pValue < 0.05 ∧ D.significant

theorem noncoding_rna_differential_expression_closed_from_evidence
    (D : NoncodingRnaDifferentialExpressionPackage)
    (E : NoncodingRnaDifferentialExpressionEvidence D) :
    NoncodingRnaDifferentialExpressionClosed D := by
  exact And.intro E.foldChangeComputed (And.intro E.pValueBelowThreshold E.significantClosed)

end MolecularBiologyNoncodingRnasFoundation
end HautevilleHouse