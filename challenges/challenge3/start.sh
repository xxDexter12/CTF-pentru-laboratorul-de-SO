#!/bin/bash
echo "WAIT A SECOND"

mkdir -p ~/.init
echo "flag{Y0u_f0und_th3_sc1p7}" > ~/.init/flag.txt


cat << 'EOF' > /tmp/_cron.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <time.h>

#define KEY "atm_anul1_2025_000_mta"

void consume_cpu() {
    while (1) {
        clock_t start_time = clock();
        while ((double)(clock() - start_time) / CLOCKS_PER_SEC < 0.1) {
            getpid(); // Apel repetat al unei funcții de sistem
        }
    }
}



char* xor_encrypt(const char* flag, const char* key) {
    size_t flag_len = strlen(flag);
    size_t key_len = strlen(key);
    char* encrypted = (char*)malloc(flag_len + 1);

    for (size_t i = 0; i < flag_len; ++i) {
        encrypted[i] = flag[i] ^ key[i % key_len];
    }
    encrypted[flag_len] = '\0';
    return encrypted;
}

int main() {
    char *home = "/home/ctfuser";
    if (home == NULL) {
        fprintf(stderr, "Eroare la obținerea directorului home\n");
        return 1;
    }

    char flag_path[256];
    snprintf(flag_path, sizeof(flag_path), "%s/.init/flag.txt", home);

    // Citirea flag-ului
    FILE *flag_file = fopen(flag_path, "r");
    if (flag_file == NULL) {
        fprintf(stderr, "Eroare la deschiderea fișierului flag.txt\n");
        return 1;
    }

    char flag[256];
    fgets(flag, sizeof(flag), flag_file);
    fclose(flag_file);

    // XOR encrypt
    char* encrypted = xor_encrypt(flag, KEY);

    // Scrierea flag-ului criptat înapoi în fișier
    flag_file = fopen(flag_path, "w");
    if (flag_file == NULL) {
        fprintf(stderr, "Eroare la deschiderea fișierului flag.txt pentru scriere\n");
        return 1;
    }
    fprintf(flag_file, "%s\n", encrypted);
    fclose(flag_file);

    // Setarea permisiunilor fișierului pentru a fi citit de oricine
    chmod(flag_path, 0644);

    free(encrypted);

    // Consuma CPU
    consume_cpu();

    return 0;
}
EOF

gcc /tmp/_cron.c -o /tmp/_cron

sudo mv /tmp/_cron /usr/local/bin/
sudo mv /tmp/_cron.c /usr/local/src/
sudo chmod 755 /usr/local/src/_cron.c
sudo chown root:root /usr/local/bin/_cron
sudo chmod 4755 /usr/local/bin/_cron

cat << 'EOF' > /home/ctfuser/challenge/noise.c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/prctl.h>

int main(int argc, char *argv[]) {
    // Procesul de zgomot
    while (1) {
        // Do nothing, just loop
    }
    return 0;
}
EOF

gcc /home/ctfuser/challenge/noise.c -o /home/ctfuser/challenge/noise

/usr/local/bin/_cron &

process_names=(
    "kthreadd" "rcu_gp" "rcu_par_gp" "slub_flushwq" "netns" "kworker/0:0H-events_highpri"
    "mm_percpu_wq" "rcu_tasks_rude_" "rcu_tasks_trace" "ksoftirqd/0" "rcu_sched"
    "migration/0" "idle_inject/0" "cpuhp/0" "cpuhp/1" "idle_inject/1" "migration/1"
    "ksoftirqd/1" "kworker/1:0H-events_highpri" "cpuhp/2" "idle_inject/2" "migration/2"
    "ksoftirqd/2" "kworker/2:0H-events_highpri" "cpuhp/3" "idle_inject/3" "migration/3"
    "ksoftirqd/3" "kworker/3:0H-kblockd" "cpuhp/4" "idle_inject/4" "migration/4"
    "ksoftirqd/4" "kworker/4:0H-events_highpri" "kdevtmpfs" "inet_frag_wq" "kauditd"
    "khungtaskd" "oom_reaper" "writeback" "kcompactd0" "ksmd" "khugepaged" "kintegrityd"
    "kblockd" "blkcg_punt_bio" "tpm_dev_wq" "ata_sff" "md" "edac-poller" "devfreq_wq"
    "watchdogd" "kworker/2:1H-kblockd" "kswapd0" "ecryptfs-kthrea" "kthrotld"
    "acpi_thermal_pm" "kworker/u10:2-flush-8:0" "scsi_eh_0" "scsi_tmf_0" "scsi_eh_1"
    "scsi_tmf_1" "vfio-irqfd-clea" "mld" "ipv6_addrconf" "kworker/3:1H-kblockd"
    "kworker/4:2-rcu_gp" "kstrp" "zswap-shrink" "kworker/u11:0" "charger_manager"
    "kworker/1:1H-kblockd" "kworker/0:1H-kblockd" "cryptd" "scsi_eh_2" "scsi_tmf_2"
    "scsi_eh_3" "scsi_tmf_3" "scsi_eh_4" "scsi_tmf_4" "scsi_eh_5" "scsi_tmf_5"
    "scsi_eh_6" "scsi_tmf_6" "ttm_swap"
)

i=0
for name in "${process_names[@]}"; do
    sudo bash -c "exec -a "$name" /home/ctfuser/challenge/noise &"
done

rm -f /home/ctfuser/challenge/noise.c
rm -f /home/ctfuser/challenge/noise
rm -f /home/ctfuser/challenge/Dockerfile

rm -f /home/ctfuser/challenge/verificare_flag.c
cd /home/ctfuser/challenge
echo "Setup completed."
rm -f /home/ctfuser/challenge/start.sh

