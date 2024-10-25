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
    sh 'curl -h'
    sh 'curl -L https://github.com/in-toto/witness/releases/download/v0.6.0/witness_0.6.0_darwin_amd64.tar.gz > witness_0.6.0_darwin_amd64.tar.gz'
    sh 'tar -xzf "witness_0.6.0_darwin_amd64.tar.gz"'
    sh 'chmod u+x witness'
    sh './witness -h'
    }
}

stage('Build'){
    steps {
        sh 'uname -m'
        sh 'pip3 install -r requirements.txt'
    }
}

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
