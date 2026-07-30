import HautevilleHouse.MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.ExpressionQuantificationPackage

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RegulatoryInteractionPackage {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M} where
  targetGene : String
  regulatoryMechanism : String  -- e.g., "miRNA_mRNA", "lncRNA_chromatin"
  bindingSiteEvidence : Prop
  functionalValidation : Prop

structure RegulatoryInteractionEvidence {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M}
    (R : RegulatoryInteractionPackage G T M E) where
  bindingSiteEvidenceClosed : R.bindingSiteEvidence
  functionalValidationClosed : R.functionalValidation

def RegulatoryInteractionClosed {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M}
    (R : RegulatoryInteractionPackage G T M E) : Prop :=
  R.bindingSiteEvidence ∧ R.functionalValidation

theorem regulatory_interaction_closed_from_evidence
    {G : GenomicLocusPackage} {T : TranscriptomeAssemblyPackage G}
    {M : RnaSequenceMotifPackage G T} {E : ExpressionQuantificationPackage G T M}
    (R : RegulatoryInteractionPackage G T M E) (Ev : RegulatoryInteractionEvidence R) :
    RegulatoryInteractionClosed R := by
  exact And.intro Ev.bindingSiteEvidenceClosed Ev.functionalValidationClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse