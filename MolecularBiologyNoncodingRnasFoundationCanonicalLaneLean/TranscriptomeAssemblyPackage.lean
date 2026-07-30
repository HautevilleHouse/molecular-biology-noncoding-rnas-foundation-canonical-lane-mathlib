import HautevilleHouse.MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean.GenomicLocusPackage

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure TranscriptomeAssemblyPackage {G : GenomicLocusPackage} where
  referenceGenomeId : String
  rnaSequencingData : Type u
  assembledTranscripts : Type v
  spliceGraphComputed : Prop
  transcriptCoverageValid : Prop

structure TranscriptomeAssemblyEvidence {G : GenomicLocusPackage}
    (T : TranscriptomeAssemblyPackage G) where
  spliceGraphComputedClosed : T.spliceGraphComputed
  transcriptCoverageValidClosed : T.transcriptCoverageValid

def TranscriptomeAssemblyClosed {G : GenomicLocusPackage}
    (T : TranscriptomeAssemblyPackage G) : Prop :=
  T.spliceGraphComputed ∧ T.transcriptCoverageValid

theorem transcriptome_assembly_closed_from_evidence
    {G : GenomicLocusPackage} (T : TranscriptomeAssemblyPackage G)
    (E : TranscriptomeAssemblyEvidence T) : TranscriptomeAssemblyClosed T := by
  exact And.intro E.spliceGraphComputedClosed E.transcriptCoverageValidClosed

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse