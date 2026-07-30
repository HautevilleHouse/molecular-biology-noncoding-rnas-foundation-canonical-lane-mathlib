import HautevilleHouse.MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.RnaSequenceMotifPackage

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure ExpressionQuantificationPackage {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T} where
  readCounts : Nat
  normalizedExpression : Float
  expressionSignificance : Prop
  batchCorrectionApplied : Prop

structure ExpressionQuantificationEvidence {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    (E : ExpressionQuantificationPackage G T M) where
  expressionSignificanceClosed : E.expressionSignificance
  batchCorrectionAppliedClosed : E.batchCorrectionApplied

def ExpressionQuantificationClosed {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    (E : ExpressionQuantificationPackage G T M) : Prop :=
  E.expressionSignificance ∧ E.batchCorrectionApplied

theorem expression_quantification_closed_from_evidence
    {G : GenomicLocusPackage} {T : TranscriptomeAssemblyPackage G}
    {M : RnaSequenceMotifPackage G T} (E : ExpressionQuantificationPackage G T M)
    (Ev : ExpressionQuantificationEvidence E) : ExpressionQuantificationClosed E := by
  exact And.intro Ev.expressionSignificanceClosed Ev.batchCorrectionAppliedClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse