import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure TranscriptomicsEvidenceTerms (P : NoncodingRnaTranscriptomicsPackage) where
  smallRnasFractionClosed : P.smallRnasFraction
  mrnaFractionClosed : P.mrnaFraction
  noncodingRnasFractionClosed : P.noncodingRnasFraction
  expressionLevelsReproducibleClosed : P.expressionLevelsReproducible
  transcriptomicsClosed : NoncodingRnaTranscriptomicsClosed P

def NoncodingRnaTranscriptomicsPackage.evidenceTerms
    (P : NoncodingRnaTranscriptomicsPackage) (E : NoncodingRnaTranscriptomicsEvidence P) :
    TranscriptomicsEvidenceTerms P :=
  { smallRnasFractionClosed := E.smallRnasFractionClosed
    mrnaFractionClosed := E.mrnaFractionClosed
    noncodingRnasFractionClosed := E.noncodingRnasFractionClosed
    expressionLevelsReproducibleClosed := E.expressionLevelsReproducibleClosed
    transcriptomicsClosed := noncoding_rna_transcriptomics_closed_from_evidence P E
  }

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
