import HautevilleHouse.MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.TranscriptomeAssemblyPackage

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RnaSequenceMotifPackage {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G} where
  motif : String
  motifLength : Nat
  degeneracyAllowed : Prop
  motifMatchingComplete : Prop
  strandDirection : String

structure RnaSequenceMotifEvidence {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G}
    (M : RnaSequenceMotifPackage G T) where
  motifMatchingCompleteClosed : M.motifMatchingComplete

def RnaSequenceMotifClosed {G : GenomicLocusPackage}
    {T : TranscriptomeAssemblyPackage G}
    (M : RnaSequenceMotifPackage G T) : Prop :=
  M.degeneracyAllowed ∧ M.motifMatchingComplete

theorem rna_sequence_motif_closed_from_evidence
    {G : GenomicLocusPackage} {T : TranscriptomeAssemblyPackage G}
    (M : RnaSequenceMotifPackage G T) (E : RnaSequenceMotifEvidence M) :
    RnaSequenceMotifClosed M := by
  exact And.intro M.degeneracyAllowed E.motifMatchingCompleteClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse