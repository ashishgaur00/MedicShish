package com.medic.OperationPojo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="COM_MEDICINE_DTL")
public class MedicDetail
{
    @Id
    @Column(name ="ID")
    private Integer id;

    @Column(name ="MEDICINE_NAME")
    private String medicName;

    @Column(name ="QNTY_IN_PACKET")
    private  Integer  quantityInPacket;

    @Column(name ="PACKET_AVL")
    private  Integer  packetAvailable;


    @Column(name ="PRIZE_PER_PCKT")
    private Integer prizePerPacket;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getMedicName() {
		return medicName;
	}


	public void setMedicName(String medicName) {
		this.medicName = medicName;
	}


	public Integer getQuantityInPacket() {
		return quantityInPacket;
	}


	public void setQuantityInPacket(Integer quantityInPacket) {
		this.quantityInPacket = quantityInPacket;
	}


	public Integer getPacketAvailable() {
		return packetAvailable;
	}


	public void setPacketAvailable(Integer packetAvailable) {
		this.packetAvailable = packetAvailable;
	}


	public Integer getPrizePerPacket() {
		return prizePerPacket;
	}


	public void setPrizePerPacket(Integer prizePerPacket) {
		this.prizePerPacket = prizePerPacket;
	}

    
    
}

