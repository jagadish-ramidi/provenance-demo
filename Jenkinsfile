pipeline{
    agent any
    stages{
        
    stage('Clone')
{
    steps {
                checkout scm
            }

}

stage('setup witness'){
    steps {
    sh 'wit.sh'
    }
}

// stage('Build'){
//     commonProvenance.runWithProvenance([
//         stepName: 'build',
//         stepCommand: "docker build -t test . && docker save test > test.tar",
//         workingDir: "${env.WORKSPACE}",
//         builtImage: true,
//         writeAttestation: true,
//     ])
// }

// stage('SCA Scan'){
//     withEnv(["HARMONY_RUN_TYPE_OVERRIDE=2", "HARMONY_SNYK_DOCKER_IMAGE_OVERRIDE_PYTHON=python-3.11"]){
//         scan = new ors.security.CommonHarmony(steps, env, Artifactory, scm).run_scan([
//         'repository':"security/demo-provenance",
//         'product_name': "Demo Provenance",
//         'use_docker': true,
//         'fail_on_oast':false,
//         'analyze_results': true
//         ])
//     }
// }

// stage('Check Compliance'){
//     commonProvenance.verifyPolicies(
//         [
//             'attestationPath': "${env.WORKSPACE}/git-attestation.json",
//             'artifactPath': "${env.WORKSPACE}/test.tar"

//         ]
//     )
// }


}


}
