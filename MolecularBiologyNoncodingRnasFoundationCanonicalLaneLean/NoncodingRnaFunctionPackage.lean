import HautevilleHouse.MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.RegulatoryInteractionPackage

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure NoncodingRnaFunctionPackage {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M}
    {R : RegulatoryInteractionPackage G T M E} where
  rnaType : String  -- "miRNA", "lncRNA", "circRNA", etc.
  cellularProcess : String
  molecularMechanism : Prop
  diseaseAssociation : Prop

structure NoncodingRnaFunctionEvidence {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M}
    {R : RegulatoryInteractionPackage G T M E}
    (F : NoncodingRnaFunctionPackage G T M E R) where
  molecularMechanismClosed : F.molecularMechanism
  diseaseAssociationClosed : F.diseaseAssociation

def NoncodingRnaFunctionClosed {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} {M : RnaSequenceMotifPackage G T}
    {E : ExpressionQuantificationPackage G T M}
    {R : RegulatoryInteractionPackage G T M E}
    (F : NoncodingRnaFunctionPackage G T M E R) : Prop :=
  F.molecularMechanism ∧ F.diseaseAssociation

theorem noncoding_rna_function_closed_from_evidence
    {G : GenomicLocusPackage} {T : TranscriptomeAssemblyPackage G}
    {M : RnaSequenceMotifPackage G T} {E : ExpressionQuantificationPackage G T M}
    {R : RegulatoryInteractionPackage G T M E}
    (F : NoncodingRnaFunctionPackage G T M E R) (Ev : NoncodingRnaFunctionEvidence F) :
    NoncodingRnaFunctionClosed F := by
  exact And.intro Ev.molecularMechanismClosed Ev.diseaseAssociationClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse