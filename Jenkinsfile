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
    sh 'curl -L https://github.com/in-toto/witness/releases/download/v0.6.0/witness_0.6.0_darwin_arm64.tar.gz > witness_0.6.0_darwin_arm64.tar.gz'
    sh 'tar -xzf "witness_0.6.0_darwin_arm64.tar.gz"'
    sh 'chmod u+x witness'
    }
}

stage('Build'){
    steps {
        sh './witness run --step build -o build-attestation.json -a slsa,git --attestor-slsa-export -- pip3 install -r requirements.txt'
    }
}

stage('SCA Scan'){
    steps {
    sh 'curl --compressed https://downloads.snyk.io/cli/stable/snyk-macos-arm64 -o snyk'
    sh 'chmod +x ./snyk'
    sh './snyk -h'
    withCredentials([usernamePassword(credentialsId: 'snyk-token-demo', usernameVariable: 'SNYK_TOKEN', passwordVariable: 'PASSWORD')]) {
        sh 'export SNYK_TOKEN=${PASSWORD} && ./witness run --step build -o sca-att.json -a slsa,git --attestor-slsa-export -- ./snyk test --org="02f1fc29-cc99-430a-a317-0be13c7a107d" --file="requirements.txt" --json --command="python3" --fail-on="upgradable" --severity-threshold=critical > vuln.json'
    
    }
    }
}

stage('Check build Complicance'){
    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
        sh "./witness verify -k policypublic.pem -p policy.signed.json -a build-attestation.json -f hello.txt"
    }
}

stage('modify artifact'){
    echo "some data for the file" >> "hello.txt"
}

stage('Check build Complicance post manipulation'){
    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
        sh "./witness verify -k policypublic.pem -p policy.signed.json -a build-attestation.json -f hello.txt"
    }
}

}
}