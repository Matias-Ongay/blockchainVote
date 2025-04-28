// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SistemaVotacion {
    struct Candidato {
        string nombre;
        uint256 votos;
    }

    mapping(address => bool) public votantes;
    Candidato[] public candidatos;

    constructor(string[] memory nombresCandidatos) {
        for (uint i = 0; i < nombresCandidatos.length; i++) {
            candidatos.push(Candidato({
                nombre: nombresCandidatos[i],
                votos: 0
            }));
        }
    }

    function votar(uint candidatoIndex) public {
        require(!votantes[msg.sender], "Ya votaste.");
        require(candidatoIndex < candidatos.length, "Candidato invalido.");

        votantes[msg.sender] = true;
        candidatos[candidatoIndex].votos += 1;
    }

    function obtenerResultados() public view returns (Candidato[] memory) {
        return candidatos;
    }
}
