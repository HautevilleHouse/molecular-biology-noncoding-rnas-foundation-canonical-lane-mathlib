import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure RegulatoryNetworkPackage where
  transcriptionalRegulation : Prop
  postTranscriptionalRegulation : Prop
  epigeneticModulation : Prop
  signalingPathwayInteractions : Prop

structure RegulatoryNetworkEvidence (R : RegulatoryNetworkPackage) where
  transcriptionalRegulationClosed : R.transcriptionalRegulation
  postTranscriptionalRegulationClosed : R.postTranscriptionalRegulation
  epigeneticModulationClosed : R.epigeneticModulation
  signalingPathwayInteractionsClosed : R.signalingPathwayInteractions

def RegulatoryNetworkClosed (R : RegulatoryNetworkPackage) : Prop :=
  R.transcriptionalRegulation ∧ R.postTranscriptionalRegulation ∧
  R.epigeneticModulation ∧ R.signalingPathwayInteractions

theorem regulatory_network_closed_from_evidence
    (R : RegulatoryNetworkPackage) (E : RegulatoryNetworkEvidence R) :
    RegulatoryNetworkClosed R := by
  exact And.intro E.transcriptionalRegulationClosed
    (And.intro E.postTranscriptionalRegulationClosed
      (And.intro E.epigeneticModulationClosed E.signalingPathwayInteractionsClosed))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse